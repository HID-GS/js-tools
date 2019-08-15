FROM node:8.16-alpine

ENV PKG eslint-config-airbnb

RUN npm install -g eslint \
    stylelint \
    stylelint-no-browser-hacks \
    stylelint-config-standard \
    stylelint-junit-formatter \
    eslint-plugin-prettier \
    eslint-config-prettier \
    prettier \
    yarn \
    && npm info "$PKG@latest" peerDependencies --json \
    | command sed 's/[\{\},]//g ; s/: /@/g' \
    | xargs npm install --save-dev "$PKG@latest"

WORKDIR /app

CMD ["eslint", "."]
