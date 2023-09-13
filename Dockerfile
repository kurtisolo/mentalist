# Usa un'immagine Node come base
FROM node:lts-alpine

# Crea la directory dell'app nel container
WORKDIR /app

# Copia package.json e package-lock.json
COPY package*.json ./

# Installa le dipendenze
RUN npm install

# Copia il codice sorgente nell'immagine
COPY . .

# Compila l'app per la produzione
RUN npm run build

# Usa un'immagine di Nginx per servire l'app costruita
FROM nginx:stable-alpine

# Copia i file di produzione
COPY --from=0 /app/dist /usr/share/nginx/html

# Espone la porta 80
EXPOSE 80

# Avvia Nginx
CMD ["nginx", "-g", "daemon off;"]
