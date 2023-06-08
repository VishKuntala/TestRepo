import QuadTree from './QuadTree.js';
import * as markerShapes from './markerShapes/index.js';
/**
 * This L.GridLayer.MaskCanvas plugin is for Leaflet 1.0
 * For Leaflet 0.7.x, please use L.TileLayer.MaskCanvas
 */
L.GridLayer.MaskCanvas = L.GridLayer.extend({
    options: {
        radius: 5, // this is the default radius (specific radius values may be passed with the data)
        useAbsoluteRadius: true,  // true: radius in meters, false: radius in pixels
        opacity: 1,
        noMask: true,  // true results in normal (filled) circled, instead masked circles
        lineColor: undefined,  // color of the shape outline if noMask is true
        lineWidth: undefined, // width of the shape outline if noMask is true
        fillColor: '#808080', // grey fill color in the absence of a heat map object
        debug: false,
        zIndex: 18, // if it is lower, then the layer is not in front,
        heatMapObject: {}, // key-value pairs for the heat map colors based on a range of values for a particular data point
        heatMapDataKey: null, // data key whose value drives the color for the markers. Used in _getColor function along with the heatmap object.
        heatMapActivationZoomLevel: 1, // the zoom level at which the heat map colors for the markers kick in.
        markerShape: 'CIRCLE',
        markerScaleFactor: 1, // marker size scale factor
        markerSizeOffsetFromZoomValue: 8, // the amount by which the size is decreaes (or increased) based on the current zoom value - can be a positive/negative value
        noFill: false, // flag to indicate if the marker is not filled
        minZoomBorderVisibility: 0, // minimum zoom to show the border on the marker
        maxZoomBorderVisibility: 20, // maximum zoom to show the border on the marker
        properties: null

    },

    initialize: function (options) {
        L.setOptions(this, options);
    },

    createTile: function (coords) {
        var tile = document.createElement('canvas');
        tile.width = tile.height = this.options.tileSize;

        this._draw(tile, coords);

        if (this.options.debug) {
            this._drawDebugInfo(tile, coords);
        }

        return tile;
    },

    _drawDebugInfo: function (canvas, coords) {
        var tileSize = this.options.tileSize;
        var ctx = canvas.getContext('2d');

        ctx.globalCompositeOperation = 'xor';

        ctx.fillStyle = '#fff';
        ctx.fillRect(0, 0, tileSize, tileSize);

        ctx.strokeStyle = '#000';
        ctx.strokeText('x: ' + coords.x + ', y: ' + coords.y + ', zoom: ' + coords.z, 20, 20);

        ctx.strokeStyle = '#f55';
        ctx.beginPath();
        ctx.moveTo(0, 0);
        ctx.lineTo(tileSize, 0);
        ctx.lineTo(tileSize, tileSize);
        ctx.lineTo(0, tileSize);
        ctx.closePath();
        ctx.stroke();
    },

    /**
     * Pass either pairs of (y,x) or (y,x,radius) coordinates.
     * Alternatively you can also pass LatLng objects.
     *
     * Whenever there is no specific radius, the default one is used.
     *
     * @param {[[number, number]]|[[number, number, number]]|[L.LatLng]} dataset
     */
    setData: function (dataset, properties) {
        var self = this;
        self.options.properties = properties;
        this.bounds = new L.LatLngBounds(dataset);

        this._quad = new QuadTree(this._boundsToQuery(this.bounds), false, 6, 6);

        var first = dataset[0];
        var xc = 1, yc = 0, rc = 2;
        if (first instanceof L.LatLng) {
            xc = "lng";
            yc = "lat";
        }

        this._maxRadius = 0;
        dataset.forEach(function (d, index) {
            // var radius = d[rc] || self.options.radius;
            var radius = self.options.radius;
            self._quad.insert({
                x: d[xc], //lng
                y: d[yc], //lat
                r: radius,
                properties: properties[index]
            });
            self._maxRadius = Math.max(self._maxRadius, radius);
        });

        if (this._map) {
            this.redraw();
        }
    },

    /**
     * Set default radius value.
     *
     * @param {number} radius
     */
    setRadius: function (radius) {
        this.options.radius = radius;
        L.setOptions(this, this.options);
        this.redraw();
    },

    /**
     * Returns the biggest radius value of all data points.
     *
     * @param {number} zoom Is required for projecting.
     * @returns {number}
     * @private
     */
    _getMaxRadius: function (zoom) {
        return this._calcRadius(this._maxRadius, zoom);
    },

    /**
     * @param {L.Point} coords
     * @param {{x: number, y: number, r: number}} pointCoordinate
     * @returns {[number, number, number]}
     * @private
     */
    _tilePoint: function (coords, pointCoordinate) {
        // start coords to tile 'space'
        var s = coords.multiplyBy(this.options.tileSize);

        // actual coords to tile 'space'
        var p = this._map.project(new L.LatLng(pointCoordinate.y, pointCoordinate.x), coords.z);

        // point to draw
        var x = Math.round(p.x - s.x);
        var y = Math.round(p.y - s.y);
        // var r = this._calcRadius(pointCoordinate.r || this.options.radius, coords.z);
        var r = this._calcRadius(this.options.radius, coords.z);
        return [x, y, r];
    },

    _boundsToQuery: function (bounds) {
        if (bounds.getSouthWest() == undefined) { return { x: 0, y: 0, width: 0.1, height: 0.1 }; }  // for empty data sets
        return {
            x: bounds.getSouthWest().lng,
            y: bounds.getSouthWest().lat,
            width: bounds.getNorthEast().lng - bounds.getSouthWest().lng,
            height: bounds.getNorthEast().lat - bounds.getSouthWest().lat
        };
    },

    /**
     * The radius of a circle can be either absolute in pixels or in meters.
     *
     * @param {number} radius Pass either custom point radius, or default radius.
     * @param {number} zoom Zoom level
     * @returns {number} Projected radius (stays the same distance in meters across zoom levels).
     * @private
     */
    _calcRadius: function (radius, zoom) {
        var projectedRadius;

        if (this.options.useAbsoluteRadius) {
            var latRadius = (radius / 40075017) * 360,
                lngRadius = latRadius / Math.cos(Math.PI / 180 * this._latLng.lat),
                latLng2 = new L.LatLng(this._latLng.lat, this._latLng.lng - lngRadius, true),
                point2 = this._latLngToLayerPoint(latLng2, zoom),
                point = this._latLngToLayerPoint(this._latLng, zoom);
            // adjust radius by zoom level
            projectedRadius = Math.max(Math.round(point.x - point2.x), (zoom - this.options.markerSizeOffsetFromZoomValue) * this.options.markerScaleFactor);
        } else {
            projectedRadius = radius;
        }

        return projectedRadius;
    },

    /**
     * This is used instead of this._map.latLngToLayerPoint
     * in order to use custom zoom value.
     *
     * @param {L.LatLng} latLng
     * @param {number} zoom
     * @returns {L.Point}
     * @private
     */
    _latLngToLayerPoint: function (latLng, zoom) {
        var point = this._map.project(latLng, zoom)._round();
        return point._subtract(this._map.getPixelOrigin());
    },

    /**
     * @param {HTMLCanvasElement|HTMLElement} canvas
     * @param {L.Point} coords
     * @private
     */
    _draw: function (canvas, coords) {
        if (!this._quad || !this._map) {
            return;
        }

        var tileSize = this.options.tileSize;

        var nwPoint = coords.multiplyBy(tileSize);
        var sePoint = nwPoint.add(new L.Point(tileSize, tileSize));

        if (this.options.useAbsoluteRadius) {
            var centerPoint = nwPoint.add(new L.Point(tileSize / 2, tileSize / 2));
            this._latLng = this._map.unproject(centerPoint, coords.z);
        }

        // padding
        var pad = new L.Point(this._getMaxRadius(coords.z), this._getMaxRadius(coords.z));
        nwPoint = nwPoint.subtract(pad);
        sePoint = sePoint.add(pad);

        var bounds = new L.LatLngBounds(this._map.unproject(sePoint, coords.z), this._map.unproject(nwPoint, coords.z));

        var pointCoordinates = this._quad.retrieveInBounds(this._boundsToQuery(bounds));

        this._drawPoints(canvas, coords, pointCoordinates);
    },

    // get color depending on datapoint value
    _getColor: function (dpv, zoom) {
        return zoom >= this.options.heatMapActivationZoomLevel && this.options.heatMapObject[dpv] ?
        this.options.heatMapObject[dpv] : this.options.fillColor;
    },

  /**
   * @param {HTMLCanvasElement} canvas
   * @param {L.Point} coords
   * @param {[{x: number, y: number, r: number}]} pointCoordinates
   * @private
   */
  _drawPoints: function (canvas, coords, pointCoordinates) {
    var ctx = canvas.getContext('2d'),
          tilePoint;
      let lineWidth = this.options.lineWidth || 1;
      let lineColor = this.options.lineColor;
      if (coords.z <= this.options.minZoomBorderVisibility || coords.z >= this.options.maxZoomBorderVisibility) {
          lineWidth = 0;
          lineColor = undefined;
      } 
    if (lineColor) {
        ctx.strokeStyle = lineColor;       
        ctx.lineWidth = lineWidth;
    }

    ctx.globalCompositeOperation = 'source-over';
    if (!this.options.noMask && !this.options.debug) {
      ctx.fillRect(0, 0, this.options.tileSize, this.options.tileSize);
      ctx.globalCompositeOperation = 'destination-out';
    }

    for (var index in pointCoordinates) {
      if (pointCoordinates.hasOwnProperty(index)) {
        tilePoint = this._tilePoint(coords, pointCoordinates[index]);
        if (this.options.noFill) {
            ctx.strokeStyle = this._getColor(pointCoordinates[index].properties[this.options.heatMapDataKey],coords.z);
            ctx.lineWidth = lineWidth;
        } else {
            ctx.fillStyle=this._getColor(pointCoordinates[index].properties[this.options.heatMapDataKey], coords.z);
        }
        ctx.beginPath();
        markerShapes[(this.options.markerShape || 'CIRCLE').toLowerCase()].draw(ctx, tilePoint, this.options.noFill, lineWidth);

        this.options.noFill ?  ctx.stroke() : ctx.fill();
        ctx.closePath();
      }
    }
  }
});

L.TileLayer.maskCanvas = function(options) {
  return new L.GridLayer.MaskCanvas(options);
};

export default L.TileLayer.maskCanvas;
