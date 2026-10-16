
FROM rust:1.82-slim AS builder
WORKDIR /app
COPY Cargo.toml ./
COPY src ./src
RUN cargo build --release


FROM debian:bookworm-slim
COPY --from=builder /app/target/release/perfreport /usr/local/bin/perfreport
ENTRYPOINT ["/usr/local/bin/perfreport"]