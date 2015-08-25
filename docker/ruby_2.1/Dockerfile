# Heavily borrowed from https://github.com/docker-library/ruby/blob/3c8701dbc263001651f8a0ac44bfb1c6113b69fa/2.1/Dockerfile
FROM buildpack-deps:jessie

ENV RUBY_MAJOR=2.1 \
    RUBY_VERSION=2.1.6 \
    RUBY_DOWNLOAD_SHA256=1e1362ae7427c91fa53dc9c05aee4ee200e2d7d8970a891c5bd76bee28d28be4 \
    BUNDLER_VERSION=1.10.6 \
    GEM_PATH=/usr/local/lib/ruby/gems/2.1.0

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
  && rm -r /usr/src/ruby

# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

RUN gem install bundler --version "$BUNDLER_VERSION"

CMD [ "irb" ]
