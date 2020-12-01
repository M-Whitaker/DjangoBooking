// const isBuild = process.env.NODE_ENV === 'production'

const webpack = require('webpack');
const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

const providePluginList = {
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
}


/*
MAIN
*/
module.exports = {
    entry: {
        base: './src/base.ts'
    },
    devtool: 'source-map',
    output: {
        filename: './js/[name].bundle.js',
        path: path.resolve(__dirname, 'dist')
    },
    module: {
        rules: [
            {
                test: /\.(js|ts)x?$/,
                use: {
                loader: 'babel-loader',
                }
            },
            {
                test: /\.(css|scss)$/,
                use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"]
            }
        ]
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: './styles/[name].css'
        }),
        new webpack.ProvidePlugin(providePluginList)
    ],
    resolve: {
        extensions: ['.tsx', '.ts', '.jsx', '.js', '.json', '.css', '.scss']
    }
}