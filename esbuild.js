const path = require('path');
const { nodeResolve } = require('@rollup/plugin-node-resolve');
const commonjs = require('@rollup/plugin-commonjs');

const isProduction = process.env.NODE_ENV === 'production';

const options = {
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  sourcemap: true,
  outdir: 'app/assets/builds',
  outfile: 'app/assets/builds/application.js',
  publicPath: 'assets',
  format: 'esm',
  plugins: [
    nodeResolve({ browser: true }),
    commonjs(),
  ],
  external: ['@hotwired/stimulus-loading']
};
esbuild.build(options);
module.exports = options;
