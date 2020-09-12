# workspace

## vue cli 설치 정보

```text
Features:             Vue 2.x, Babel, Router, Vuex, Linter
Router history mode:  Yes
Linter/formatter:     eslint + prettier
config placing:       in dedicated config files
```

Unit testing 이나 PWA 같은 추가적인 기능은 추후 `vue add` 명령을 통해 추가 할 수 있음

자세한 내용은 [vue add](https://cli.vuejs.org/guide/plugins-and-presets.html#installing-plugins-in-an-existing-project) 를 참고하세요

---

## 추가한 내용

### prettier 룰 설정

```javascript
// .prettierrc.js

module.exports = {
  // 홑 따옴표를 주로 사용
  singleQuote: true,
  // 항상 세미콜론을 붙임
  semi: true,
  // 탭 대신 스페이스를 사용
  useTabs: false,
  // 스페이스 간격 2
  tabWidth: 2,
  // 오브젝트, 배열등의 모든 항목 끝에 콤마를 넣는다
  trailingComma: 'all',
  // 80 자를 넘길경우 자동 래핑
  printWidth: 80,
  // 객체 리터럴과 중괄호 사이에 공백 추가 : {foo: bar} ==> { foo: bar }
  bracketSpacing: true,
  // 단독 화살표 함수에서 항상 괄호 사용 : 'x => x' ==> '(x) => x'
  arrowParens: 'always',
  // 오브젝트 속성의 따옴표 처리에 대해 일관되게 함
  quoteProps: 'consistent',
  //
  // 특정 언어별 설정 가능
  // "overrides": [
  //     {
  //         "files": ["*.md", "*.yml"],
  //         "options": {
  //             "tabWidth": 2
  //         }
  //     }
  // ]
};
```

[.prettierrc.js](.prettierrc.js) 파일을 추가하여  
prettier가 동작하기 위한 룰 추가

자세한 내용은 [prettier의 동작을 정리한 파일](PrettierBehavior/PrettierBehavior.vue)을 참고하세요

### vscode 설정

[.vscode/settings.json](.vscode/settings.json) 파일을 추가하여  
다음과 같은 기능을 팀원과 공유

- 기본 포매터 지정
- 저장 시 포맷 활성화
- 탭 사이즈 2
- ... 이 외 기타 원활한 동작을 위한 설정들

### devcontainer 설정

[.devcontainer](.devcontainer) 디렉토리를 추가하여  
다음과 같은 기능을 팀원과 공유

- 컨테이너에서 실행되는 통일된 개발 환경

윈도우에서 이 기능을 사용하려면 WSL2 설치가 필요합니다.  
WSL2 설치에 대한 자세한 내용은 [WSL2 설치하기] 문서를 참고하세요.  
컨테이너를 시작하는 자세한 내용은 [git 저장소에서 컨테이너 시작하기] 문서를 참고하세요.

[wsl2 설치하기]: https://docs.microsoft.com/ko-kr/windows/wsl/install-win10#update-to-wsl-2
[git 저장소에서 컨테이너 시작하기]: https://code.visualstudio.com/docs/remote/containers#_quick-start-open-a-git-repository-or-github-pr-in-an-isolated-container-volume

---

## 수정 한 내용

### eslint-plugin-vue 에서 강력히 권장하는 린트 룰로 변경

```javascript
// .eslintrc.js

module.exports = {
  extends: [
    // =========== 기존 ===========
    'plugin:vue/recommended',

    // =========== 변경 ===========
    'plugin:vue/strongly-recommended',
  ],
};
```

[.eslintrc.js](.eslintrc.js) 파일을 수정하여  
린트 규칙을 권장 내용으로 변경

자세한 내용은 [strongly recommended](https://eslint.vuejs.org/rules/#priority-b-strongly-recommended-improving-readability-for-vue-js-2-x) 를 참고하세요

### 불필요한 lint 에러 제거

```javascript
// .eslintrc.js

module.exports = {
  rules: {
    // =========== 기존 ===========

    // =========== 추가 ===========
    'prettier/prettier': 'off',
  },
};
```

[.eslintrc.js](.eslintrc.js) 파일을 수정하여  
prettier에서 자동으로 수정하는 항목에서는 lint 에러가 발생하지 않도록 함

### eslint와 prettier 버전 업데이트

@vue/cli 에서 설치하는 eslint 와 prettier은 outdated 된 예전 버전임.  
정상적인 동작을 위해서 다음 명령으로 업데이트 함

```bash
npx npm-check -u
```

- eslint
  - 기존: ^6.7.2
  - 변경: ^7.8.1
- prettier
  - 기존: ^1.19.1
  - 변경: ^2.1.1

eslint의 변경 내용은 [eslint release note](https://eslint.org/blog/2020/05/eslint-v7.0.0-released) 참고  
prettier의 변경 내용은 [prettier release note](https://prettier.io/blog/2020/08/24/2.1.0.html) 참고

---

## Project setup

```bash
npm install
```

### Compiles and hot-reloads for development

```bash
npm run serve
```

### Compiles and minifies for production

```bash
npm run build
```

### Lints and fixes files

```bash
npm run lint
```

### Customize configuration

See [Configuration Reference](https://cli.vuejs.org/config/).
