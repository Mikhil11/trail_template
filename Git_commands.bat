git init -b main
git add . && git commit -m "First commit"
gh repo create trail_template --private
git remote add origin https://github.com/Mikhil11/trail_template.git
git remote -v
git push origin main
