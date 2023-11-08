FROM minidocks/sphinx-doc

RUN apk add make
RUN pip install sphinxcontrib.jquery==4.1