# nodejs + vue + webpack HMR(Hot moduel replace) + mariadb

- 관리자 : 이형욱

```bash
npm install # 의존성 설치(package.json)
npm start   # webpack-dev-server 실행
            # localhost:8000 -> 자동으로 포워딩 됨
```

## 포매터 사용

- **Eslint** : 자바스크립트, 웹 관련 파일에 대한 기본 포매터

  - `Ctrl+S`로 세이브 할 경우 eslint 에 의해 자동 포맷됨. (.js, .ts, .vue, .html )
    - `.eslintrc.js` 에 설정한 포맷 규칙을 따름
    - 참고 : <https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint>
  - `.vscode/settings.json` 에 eslint.probe 목록에 eslint가 lint&format 할 언어 목록을 지정해 줬음
  - 또한 동 파일에 eslint 로 포맷하기 위한 언어별 설정을 포함해 줬음

- **Prettier** : 그 외 .yaml, .md, .css 파일 등에 대한 기본 포매터
  - `Ctrl+S`로 세이브하면 prettier 에 의해 자동 포맷됨. (.yaml, .md, .css, ...)
    - `.prettierrc` 에 설정한 포맷 규칙을 따름
    - 참고 : <https://prettier.io/docs/en/options.html>

### 포매터를 Eslint, Prettier로 나눠서 사용하는 이유

- **Eslint**
  - 자바스크립트와 html 린팅에 최적화 되고, 보다 세부적인 규칙 설정이 가능함
  - Eslint의 --fix 기능을 포매터로써 활용할 수 있음
- **Prettier**
  - 자바스크립트 뿐만 아니라, css, yaml, python, sasss 등 다양한 언어의 포매팅을 지원함
  - 속도가 빠름

즉 Eslint만 쓰면 다른 언어들을 포맷팅 하기 어렵고  
Prettier만 쓰면 자바스크립트와 html 의 세부적인 규칙 설정이 불가능하기 때문  
-> 좋은것만 골라쓰겠다

## HMR 사용

HMR(Hot module replace) 는 webpack-dev-server 에서 제공하는 기능.  
소스 코드의 변화를 감지하여 변경시 클라이언트에서 자동으로 새로고침 해준다.  
개발 편의 기능

`npm start` 로 webpack-dev-server 실행후 클라이언트에서 접속한다.  
코드 수정 후 저장하면 자동으로 리로드 된다.
