from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
# from flask_wtf import RecaptchaField
import json
from datetime import datetime
import math

app = Flask(__name__)
app.secret_key= '\xfd{H\xe5<\x95\xf9\xe3\x96.5\xd1\x01O<!\xd5\xa2\xa0\x9fR"\xa1\xa8'



with open('config.json','r') as cfg:
    param=json.load(cfg)['parameter']

app.config.update({        #### Making the connection with the server
    "MAIL_SERVER": 'smtp.gmail.com',
    "MAIL_PORT": '465',
    "MAIL_USE_SSL": True,
    "MAIL_USERNAME": param['mail_username'],
    "MAIL_PASSWORD": param['mail_pass']
})

mail=Mail(app)     ####### NOTE: The instance should be made afterupdating the app.confif.update

localhost=True
if localhost:
    app.config['SQLALCHEMY_DATABASE_URI'] = param['local_uri']  ## Connecting to the database
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = param['product_uri']

app.config['SQLALCHEMY_TRACK_MODIFICATIONS']= False
db = SQLAlchemy(app)

db=SQLAlchemy(app)  # Connecting to the database
class Contact(db.Model):
    #  These variables name should match with the database columns name and class name should be table_name
    sNo = db.Column(db.Integer,primary_key=True, nullable=False)
    Name= db.Column(db.String,primary_key=False, nullable=False)
    email_id=db.Column(db.String,primary_key=False, nullable=False)
    phone_no=db.Column(db.Integer,nullable=False)
    Date=db.Column(db.String,primary_key=False, nullable=True)
    message=db.Column(db.String,primary_key=False, nullable=False)

class Projects(db.Model): # NAme of the clas should be same as name of the table(case Sensitive)
    sNo = db.Column(db.Integer,primary_key=True, nullable=False)
    project_name= db.Column(db.String,primary_key=False, nullable=False)
    slug= db.Column(db.String,primary_key=False, nullable=False,unique=True)
    tagline=db.Column(db.String,primary_key=False, nullable=False)
    description=db.Column(db.Integer,nullable=False)
    link=db.Column(db.String,primary_key=False, nullable=False)
    img_name=db.Column(db.String,primary_key=False, nullable=False)
    date=db.Column(db.String,primary_key=False, nullable=False)



@app.route('/')
def home():
    projects=Projects.query.filter_by().all()
    last=math.ceil(len(projects)/int(param['no_of_posts']))

    page=request.args.get('page')
    
    if(not str(page).isnumeric()):
        page=1
    page=int(page)

    projects=projects[(page-1)*int(param['no_of_posts']): (page-1)*int(param['no_of_posts']) + int(param['no_of_posts'])]
    print(page)
    if page==1:
        prev=''
        next='/?page='+str(page+1)
    elif page==last:
        prev='/?page='+str(page-1)
        next=''
    else:
        prev='/?page='+str(page-1)
        next='/?page='+str(page+1)
    return render_template('index.html',parameters=param,projects=projects,prev=prev,next=next,page=page,last=last)

@app.route('/post/<string:post_slug>',methods=['GET','POST'])
def posts_route(post_slug):  ## It is a neccessity to call the slug string in the function
    project=Projects.query.filter_by(slug=post_slug).first()
    print(project.img_name)
    return render_template('post.html',parameters=param,project=project)

@app.route('/about')
def about():
    return render_template('about.html',parameters=param)

@app.route('/contact',methods=['GET','POST'])
def contact():
    if request.method=='POST':
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        message=request.form.get('mess')

        entry=Contact(Name=name,email_id=email,phone_no=phone,message=message,Date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        try:
            mail.send_message(
            subject= f'Hello, message from {name.title()}',
            sender = f'{email}',
            recipients= [param['mail_username']],
            body = message+'\nPhone No.- '+phone
            )
        except:
            pass

    return render_template('contact.html',parameters=param)

app.run(debug=True)