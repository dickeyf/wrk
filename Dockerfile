FROM alpine:latest as builder
WORKDIR /
COPY . .
RUN apk update && apk add build-base git linux-headers perl
RUN make

FROM alpine:latest as production
COPY --from=builder /wrk /wrk
RUN apk update && apk add libgcc
CMD ["wrk"]