FROM node:8.9-alpine

ENV PKG eslint-config-airbnb

RUN npm install -g eslint \
    stylelint \
    stylelint-no-browser-hacks \
    stylelint-config-standard \
    && npm info "$PKG@latest" peerDependencies --json \
    | command sed 's/[\{\},]//g ; s/: /@/g' \
    | xargs npm install --save-dev "$PKG@latest"

WORKDIR /app

CMD ["eslint", "."]
