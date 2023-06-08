const path = require("path");
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = {
 entry: [
  "babel-polyfill",
  "./sales/modules/main"
 ],
 output: {
  path: path.join(__dirname, "/sales/modules/dist/"),
  filename: '[name].[contenthash].js'
 },
 plugins: [new CleanWebpackPlugin()],
 module: {
 rules: [
    {
      test: /\.js$/,
      exclude: /node_modules/,
      use: {
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env']
          
        }
      }
    }
  ]
 }
};