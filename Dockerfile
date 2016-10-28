FROM ruby:2-slim

COPY    Gemfile /marathon-lb-autoscale/
WORKDIR /marathon-lb-autoscale
RUN     bundle install
COPY    autoscale.rb /marathon-lb-autoscale/

ENTRYPOINT [ "/marathon-lb-autoscale/autoscale.rb" ]
CMD        [ "--marathon", "http://leader.mesos:8080", "--haproxy", "http://marathon-lb.marathon.mesos:9090" ]
