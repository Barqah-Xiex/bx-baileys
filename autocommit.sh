#!/bin/bash

# Mendapatkan direktori kerja saat ini
REPO_DIR="$(pwd)"

# Masuk ke direktori repository
cd "$REPO_DIR" || { echo "Direktori tidak ditemukan"; exit 1; }

npm version minor;

git remote -v;

# Tarik perubahan dari remote repository
git pull origin main --rebase # Ganti 'main' dengan 'master' jika perlu

# Menambahkan semua perubahan
git add .

# Memeriksa status git
if [ "$(git status --porcelain)" ]; then
  # Jika ada perubahan, lakukan commit
  git commit -m "Auto commit on $(date +'%Y-%m-%d %H:%M:%S')"

  # Push ke remote repository
  git push origin main # Ubah 'main' dengan 'master' jika branch utama Anda adalah master
  npm publish --access public
else
  echo "Tidak ada perubahan untuk di-commit."
fi
