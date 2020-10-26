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
  unzip \
  xdg-utils \
  libxcomposite1 -y
# Скачується chrome браузер
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && dpkg -i google-chrome*.deb \
  && apt install -f
#chromedriver
RUN wget https://chromedriver.storage.googleapis.com/86.0.4240.22/chromedriver_linux64.zip \
  && unzip chromedriver_linux64.zip \
  && chmod +x chromedriver
RUN mv -f chromedriver /usr/bin/google-chrome
ENV CHROME=/usr/bin/google-chrome/
# Створюються дві директорії
RUN mkdir /usr/src/app
RUN mkdir /usr/src/app/output
# Встановлюється робоча директорія для подальших там запусків\копіювань\додавань
WORKDIR /usr/src/app
# Скопійовуються дані
ADD . .
# Встановлення gem
RUN bundle install
RUN Xvfb :99 -ac -screen 0 1280x1024x24 &
RUN export DISPLAY=:99
# Які команди будуть доступні коли ранитиметься контейнер
CMD ["cucumber", "--require", "features", "--format", "pretty", "--format", "html", "--out", "output/report.html"]