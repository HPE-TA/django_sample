from .base import *

DATABASES_DEFAULT_NAME = os.getenv("DATABASES_DEFAULT_NAME", "sample")
DATABASES_DEFAULT_HOST = os.getenv("DATABASES_DEFAULT_HOST", "mysql-server")
DATABASES_DEFAULT_PORT = os.getenv("DATABASES_DEFAULT_PORT", "3306")
DATABASES_DEFAULT_USER = os.getenv("DATABASES_DEFAULT_USER", "admin")
DATABASES_DEFAULT_PASSWORD = os.getenv("DATABASES_DEFAULT_PASSWORD", "admin")

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': DATABASES_DEFAULT_NAME,
        'HOST': DATABASES_DEFAULT_HOST,
        'PORT': DATABASES_DEFAULT_PORT,
        'USER': DATABASES_DEFAULT_USER,
        'PASSWORD': DATABASES_DEFAULT_PASSWORD,
        'OPTIONS': {
            'ssl': {
                'ca': os.path.join(BASE_DIR, 'certs/BaltimoreCyberTrustRoot.crt.pem')
            }
        },
    }
}
