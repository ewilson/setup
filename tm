#export SECRET_KEY='83f900611c31ac8551e38d04d3f457b36f50c155'                                                                                                                     

git clone git://github.com/ewilson/titlematch_api.git
cd titlematch_api
mkvirtualenv tma
workon tma
pip3 install -r requirements.txt

gunicorn titlematch_api.wsgi

