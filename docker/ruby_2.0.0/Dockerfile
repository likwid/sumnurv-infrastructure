# Heavily borrowed from https://github.com/docker-library/ruby/blob/3c8701dbc263001651f8a0ac44bfb1c6113b69fa/2.0/Dockerfile
FROM buildpack-deps:jessie

ENV RUBY_MAJOR=2.0 \
    RUBY_VERSION=2.0.0-p645 \
    RUBY_DOWNLOAD_SHA256=5e9f8effffe97cba5ef0015feec6e1e5f3bacf6ace78cd1cdf72708cd71cf4ab \
    RUBYGEMS_VERSION=2.4.8 \
    BUNDLER_VERSION=1.10.6 \
    GEM_PATH=/usr/local/lib/ruby/gems/2.0.0

# skip installing gem documentation
RUN echo 'install: --no-document\nupdate: --no-document' > "$HOME/.gemrc"

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
RUN apt-get update \
  && apt-get install -y bison libgdbm-dev ruby \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /usr/src/ruby \
  && curl -fSL -o ruby.tar.gz "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz" \
  && echo "$RUBY_DOWNLOAD_SHA256 *ruby.tar.gz" | sha256sum -c - \
  && tar -xzf ruby.tar.gz -C /usr/src/ruby --strip-components=1 \
  && rm ruby.tar.gz \
  && cd /usr/src/ruby \
  && autoconf \
  && ./configure --disable-install-doc \
  && make -j"$(nproc)" \
  && make install \
  && apt-get purge -y --auto-remove bison libgdbm-dev ruby \
  && gem update --system $RUBYGEMS_VERSION \
  && rm -r /usr/src/ruby

RUN gem install bundler --version "$BUNDLER_VERSION"

CMD [ "irb" ]
