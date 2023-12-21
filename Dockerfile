#  image Alpine Node.js sebagai base
FROM node:14-alpine

#  working directory di dalam kontainer
WORKDIR /usr/src/app

#  Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Instal dependensi aplikasi
RUN npm install

# copy file-file aplikasi ke dalam kontainer
COPY . .


# Install Bash dan download script "wait-for-it.sh" dari GitHub
# hadolint ignore=DL3018
RUN apk add --no-cache bash
RUN wget --progress=dot:giga -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# ubah permission script "wait-for-it.sh" menjadi executable
RUN chmod +x /bin/wait-for-it.sh


# Expose port yang akan digunakan oleh aplikasi
EXPOSE 3000

# Tentukan perintah untuk menjalankan aplikasi
CMD ["node", "index.js"]
