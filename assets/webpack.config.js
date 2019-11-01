const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: false }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: {
      './js/app.js': ['./js/app.js'].concat(glob.sync('./vendor/**/*.js'))
  },
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, '../priv/static/js')
  },
  module: {
    rules: [
      {
        test: /\.js?$/,
        loader: 'babel-loader',
        exclude: /(node_modules)/,
        
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader',
        ]
      },
      // {
      //   test: /\.(jpe?g|png|gif|woff|woff2|eot|ttf|svg)(\?[a-z0-9=.]+)?$/,
      //   loader: 'url-loader?limit=100000'},
        {
          test: /\.(jpe?g|png|gif|woff|woff2|eot|ttf|svg)(\?[a-z0-9=.]+)?$/,
          loader: 'url-loader?limit=10000',
        },
        // Load fonts
        {
          test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?(\?.*$|$)/,
          use: 'url-loader?&limit=10000&name=/fonts/[name].[ext]',
        },
        {
          test: /\.(eot|ttf|otf)?(\?.*$|$)/,
          loader: 'file-loader?&limit=10000&name=/fonts/[name].[ext]',
        },
   
      ],
  },
  plugins: [
    new MiniCssExtractPlugin({ filename: '../css/app.scss' }),
    new CopyWebpackPlugin([{ from: 'static/', to: '../' }]),

  ]
  
});
