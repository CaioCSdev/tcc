FROM tianon/latex

WORKDIR /tcc

ADD . /tcc

CMD make
