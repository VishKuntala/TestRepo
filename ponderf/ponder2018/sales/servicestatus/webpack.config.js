const path = require("path");
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const CopyPlugin = require("copy-webpack-plugin");

module.exports = {
  mode: 'production',
 entry: [
  "babel-polyfill",
  "./modules/main"
 ],
 output: {
  publicPath : '/sales/servicestatus/dist/',
  path: path.join(__dirname, "/dist/"),
  filename: '[name].[contenthash].js'
 },
 externals: {
  jquery: 'jQuery',
 },
 plugins: [
   new CleanWebpackPlugin(),
   new CopyPlugin({
      patterns: [
        { from: path.join(__dirname, "/semantic/dist/semantic.min.css"), to: path.join(__dirname, "/dist/semantic.min.css") },
           { from: path.join(__dirname, "/semantic/dist/semantic.min.js"), to: path.join(__dirname, "/dist/semantic.min.js") },
        { from: path.join(__dirname, "/semantic/dist/themes"), to: path.join(__dirname, "/dist/themes") },
           { from: path.join(__dirname, "/tabulator.min.css"), to: path.join(__dirname, "/dist/tabulator.min.css") },
           { from: path.join(__dirname, "/tabulator.min.css.map"), to: path.join(__dirname, "/dist/tabulator.min.css.map") },
           { from: path.join(__dirname, "/tabulator_semantic-ui.min.css"), to: path.join(__dirname, "/dist/tabulator_semantic-ui.min.css") },
           { from: path.join(__dirname, "/tabulator_semantic-ui.min.css.map"), to: path.join(__dirname, "/dist/tabulator_semantic-ui.min.css.map") },
           { from: path.join(__dirname, "/maplibre-gl.css"), to: path.join(__dirname, "/dist/maplibre-gl.css") },
           { from: path.join(__dirname, "/jquery/jquery-3.6.0.min.js"), to: path.join(__dirname, "/dist/jquery-3.6.0.min.js") },
           { from: path.join(__dirname, "/ramda/ramda.min.js"), to: path.join(__dirname, "/dist/ramda.min.js") },
      ],
    })
  ],
 module: {
 rules: [
    {
      test: /\.js$/,
      exclude: /node_modules/,
      use: {
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env'],
          plugins: [
            "@babel/plugin-proposal-class-properties",
            "@babel/plugin-proposal-private-methods"
          ]
        }
      }
         },
         {
             test: /\.(jpe?g|png|gif|svg)$/i,
             type: "asset",
         },
         {
             test: /\.css$/i,
             use: ["style-loader", "css-loader"],
         },

  ]
 }
};

