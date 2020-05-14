FROM node:14-alpine

RUN npm install -g eslint-config-drupal-bundle \
    stylelint \
    stylelint-order \
    stylelint-no-browser-hacks \
    stylelint-config-standard \
    stylelint-junit-formatter

WORKDIR /app

CMD ["eslint", "."]
