const path = require("path");
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const CopyPlugin = require("copy-webpack-plugin");

module.exports = {
    mode: 'development',
    entry: [
        "babel-polyfill",
        "./modules/main"
    ],
    output: {
        publicPath: '/sales/Engineering/scoring/local/',
        path: path.join(__dirname, "/local/"),
        filename: '[name].[contenthash].js'
    },
    externals: {
        jquery: 'jQuery',
    },
    plugins: [
        new CleanWebpackPlugin(),
        new CopyPlugin({
            patterns: [
                { from: path.join(__dirname, "/semantic/dist/semantic.min.css"), to: path.join(__dirname, "/local/semantic.min.css") },
                { from: path.join(__dirname, "/semantic/dist/semantic.min.js"), to: path.join(__dirname, "/local/semantic.min.js") },
                { from: path.join(__dirname, "/semantic/dist/themes"), to: path.join(__dirname, "/local/themes") },
                { from: path.join(__dirname, "/style.css"), to: path.join(__dirname, "/local/style.css") },
                { from: path.join(__dirname, "/tabulator.min.css"), to: path.join(__dirname, "/local/tabulator.min.css") },
                { from: path.join(__dirname, "/tabulator.min.css.map"), to: path.join(__dirname, "/local/tabulator.min.css.map") },
                { from: path.join(__dirname, "/tabulator_semantic-ui.min.css"), to: path.join(__dirname, "/local/tabulator_semantic-ui.min.css") },
                { from: path.join(__dirname, "/tabulator_semantic-ui.min.css.map"), to: path.join(__dirname, "/local/tabulator_semantic-ui.min.css.map") },
                { from: path.join(__dirname, "/leaflet/leaflet.css"), to: path.join(__dirname, "/local/leaflet.css") },
                { from: path.join(__dirname, "/jquery/jquery-3.6.0.min.js"), to: path.join(__dirname, "/local/jquery-3.6.0.min.js") },
                { from: path.join(__dirname, "/leaflet/leaflet.js"), to: path.join(__dirname, "/local/leaflet.js") },
                { from: path.join(__dirname, "/ramda/ramda.min.js"), to: path.join(__dirname, "/local/ramda.min.js") }
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
            }
        ]
    }
};