module.exports = {
    env: {
        browser: true,
        commonjs: true,
        es6: true,
    },
    plugins: [
        'html',
        'vue',
    ],
    extends: [
        'eslint:recommended',       // eslint 추천 룰셋
        'airbnb-base',              // airbnb 룰셋
        'plugin:vue/recommended',   // vue 추천 룰셋
    ],
    rules: {
        // prettier 모방
        /* comma-dangle: ['error', ... airbnbn-base에 의해 설정됨] */   // prettier trailingComma:all
        'max-len': ['error', { 'code': 80, 'ignoreComments': true }],   // prettier printWidht:80
        'indent': ['error', 4, { 'ignoreComments': false }],            // prettier tabWidth:4
        'semi': ['error', 'always', { omitLastInOneLineBlock: true }],  // prettier semi:true
        'quotes': ['error', 'single'],                                  // prettier singleQuote:true
        'object-curly-spacing': ['error', 'always'],                    // prettier bracketSpacing:true
        // 추가설정
        'no-new': 'off',                                                // 변수에 저장하지 않는 new 허용
        'quote-props': ['error', 'consistent'],                         // 일관된 따옴표 붙이기만 허용
        'no-multi-spaces': ['error', { ignoreEOLComments: true }],      // one-line comment에 수직 줄맞춤 허용
        'array-element-newline': ['error', 'consistent'],               // 배열의 일관된 줄바꿈만 허용
        // vue 설정
        'vue/order-in-components': 'off',
    },
    globals: {
        Vue: 'readonly',
    },
    parserOptions: {
        ecmaVersion: 6,
    },
};
