# Sử dụng hình ảnh SQL Server từ Microsoft
FROM mcr.microsoft.com/mssql/server:2019-latest

# Thiết lập biến môi trường
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Pass12345

# Sao chép các tệp SQL script vào container
COPY book.sql /docker-entrypoint-initdb.d/
COPY order.sql /docker-entrypoint-initdb.d/
COPY user.sql /docker-entrypoint-initdb.d/
# Thiết lập làm sạch sau khi khởi tạo
ENV MSSQL_PID=Express

# Thiết lập cổng mặc định của SQL Server
EXPOSE 1433

# Thực hiện lệnh khởi tạo khi container được chạy
CMD /opt/mssql/bin/sqlservr
