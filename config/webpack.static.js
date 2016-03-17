Webpack = require('webpack')
path = require('path')
ROOT = path.join(__dirname, '..')

module.exports = {
  devtool: 'cheap-module-eval-source-map',

  entry: [
    path.join(ROOT, 'src', 'index.js')
  ],

  output: {
    path: path.join(ROOT, 'public'),
    publicPath: '/',
    filename: 'bundle.js'
  },

  module: {
    preLoaders: [{
      // set up standard-loader as a preloader
      test: /\.jsx?$/,
      include: path.join(__dirname, 'src', 'scripts'),
      loader: 'standard'
    }],

    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'babel'
      },

      {
        test: /\.styl$/,
        exclude: /node_modules/,
        loader: 'style-loader!css-loader!stylus-loader'
      }
    ]
  },

  resolve: {
    extensions: ['', '.js', '.jsx', '.styl'],
    root: [
      path.join(ROOT, 'src')
    ]
  }
};
