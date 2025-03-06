FROM ruby:3.4.2

# add user
RUN useradd developer
# create folder developer
RUN mkdir -p /home/developer
# set folder
WORKDIR /home
# set permission to folder
RUN chown -R developer:developer developer
RUN chmod 755 developer
# set user
USER developer
# Create folder app
RUN mkdir -p /home/developer/app
# use folder app
WORKDIR /home/developer/app
# copy Gemfile
COPY ./Gemfile .
# copy Gemfile.lock
COPY ./Gemfile.lock .
# install gems
RUN bundle install
# copy the main app
COPY ./ .
# expose port 3000
EXPOSE 3000
# run the app
ENTRYPOINT [ "./entrypoints/docker-entrypoint.sh" ]