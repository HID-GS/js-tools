FROM node:8.17-alpine

ENV PKG eslint-config-airbnb

RUN npm install -g eslint \
    stylelint \
    stylelint-order \
    stylelint-no-browser-hacks \
    stylelint-config-standard \
    stylelint-junit-formatter \
    eslint-plugin-prettier \
    eslint-config-prettier \
    prettier \
    && npm info "$PKG@latest" peerDependencies --json \
    | command sed 's/[\{\},]//g ; s/: /@/g' \
    | xargs npm install --save-dev "$PKG@latest"

WORKDIR /app

CMD ["eslint", "."]
