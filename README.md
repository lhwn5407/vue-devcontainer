# nodejs + vue + webpack HMR(Hot moduel replace) + mariadb

- 관리자 : 이형욱

```bash
npm install # 의존성 설치(package.json)
npm start   # webpack-dev-server 실행
            # localhost:8000 -> 포워딩 필요
```

## Eslint 포매터 사용

- eslint를 포매터로

  - `.vscode/settings.json` 설정 파일로 인해 기본 포매터가 비활성화 되고 eslint를 기본 포매터로 사용함.

- Ctrl+S 시 자동 포맷
  - `.eslint` 에 설정한 포맷 규칙에 따라 저장시 자동 포맷 해줌.
  - 참고 : <https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint>
