# Ставитьсь оболонка ruby
FROM ruby:2.4.2
# Хто створив даний Dockerfile
MAINTAINER Danylo Chalyi
# Ці команди дві перші команди ранитимуться ранитимуться, далі apt-get install і решта команд
RUN apt-get update \
  && apt-get install libxi6 \
  libnss3 \
  libgconf-2-4 \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libgbm1 \
  libgtk-3-0 \
  libx11-xcb1 \
  libxss1 \
  lsb-release \
  xdg-utils \
  libxcomposite1 -y
# Скачується chrome браузер
RUN curl -L -o google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Встановлюється пакет для оболонки Debian
RUN dpkg -i google-chrome.deb
# Встановлюються якісь налаштування
RUN sed -i 's|HERE/chrome\"|HERE/chrome\" --disable-setuid-sandbox|g' /opt/google/chrome/google-chrome
# Видаляється пакет
RUN rm google-chrome.deb
# Створюються дві директорії
RUN mkdir /usr/src/app
RUN mkdir /usr/src/app/output
# Встановлюється робоча директорія для подальших там запусків\копіювань\додавань
WORKDIR /usr/src/app
# Скопійовуються дані
ADD . .
# Встановлення gem
RUN bundle install
# Які команди будуть доступні коли ранитиметься контейнер
CMD ["cucumber", "--require", "features", "--format", "pretty", "--format", "html", "--out", "output/report.html"]