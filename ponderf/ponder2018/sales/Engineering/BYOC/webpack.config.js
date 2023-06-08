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
  publicPath : '/sales/Engineering/BYOC/dist/',
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
        { from: path.join(__dirname, "/semantic/dist/responsive.semanticui.min.css"), to: path.join(__dirname, "/dist/responsive.semanticui.min.css") },
        { from: path.join(__dirname, "/dataTables.semanticui.min.css"), to: path.join(__dirname, "/dist/dataTables.semanticui.min.css") },
        { from: path.join(__dirname, "/semantic/dist/themes"), to: path.join(__dirname, "/dist/themes") },
           { from: path.join(__dirname, "/style.css"), to: path.join(__dirname, "/dist/style.css") },
           { from: path.join(__dirname, "/leaflet/leaflet.css"), to: path.join(__dirname, "/dist/leaflet.css") },
           { from: path.join(__dirname, "/jquery/jquery-3.6.0.min.js"), to: path.join(__dirname, "/dist/jquery-3.6.0.min.js") },
           { from: path.join(__dirname, "/leaflet/leaflet.js"), to: path.join(__dirname, "/dist/leaflet.js") },
           { from: path.join(__dirname, "/ramda/ramda.min.js"), to: path.join(__dirname, "/dist/ramda.min.js") }


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