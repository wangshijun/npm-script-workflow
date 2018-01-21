    "lint:js": "eslint src/**/*.js",
    "lint:css": "stylelint src/**/*.less",
    "lint:json": "jsonlint --quiet *.json",
    "lint:markdown": "markdownlint --config .markdownlint.json *.md",

    "lint": "npm-run-all --parallel lint:*",
    "lint:js:fix": "npm run lint:js -- --fix",

    "pretest": "npm run lint",
    "test": "cross-env NODE_ENV=test mocha tests/",
    "coverage": "nyc report npm run test",

    "build:images": "scripty",
    "build:scripts": "scripty",
    "build:styles": "scripty",
    "build:hash": "scripty"
    "prebuild": "rm -rf dist/* && mkdir -p dist/{images,styles,scripts}",
    "build": "scripty",

    "watch:test": "npm t -- --watch",
    "watch:lint": "onchange -i \"src/**/*.js\" \"src/**/*.less\" -- npm run lint",
    "watch:build": "NODE_ENV=development onchange -i \"src/**/*.*\" -- npm run build",
    "watch": "npm-run-all --parallel watch:*",

    "start": "npm-run-all --parallel start:*",
    "start:reload-server": "livereload dist/ -w 5000 -d",
    "start:static-server": "http-server dist/",
    "dev": "npm run watch:build",

    "precommit": "lint-staged",
    "prepush": "npm run test",
  "lint-staged": {
    "*.js": "eslint",
    "*.less": "stylelint",
    "*.css": "stylelint",
    "*.json": "jsonlint --quiet",
    "*.md": "markdownlint --config .markdownlint.json"
  },

    "release:patch": "npm version patch && git push && git push --tags",
    "release:minor": "npm version minor && git push && git push --tags",
    "release:major": "npm version major && git push && git push --tags",
    "bump": "scripty",

    "predeploy": "yarn && NODE_ENV=production npm run build",
    "deploy": "pm2 restart pm2.json",

    "logs": "tail -f logs/*",