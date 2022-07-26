#!/bin/bash

pip install -r requirements.txt
pip install cython; pip install -U 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'

cd src/lib/model/networks
git clone https://github.com/jinfagang/DCNv2_latest.git
mv DCNv2_latest DCNv2
cd DCNv2
git checkout fa9b2fd
python3 setup.py build develop
cd ../../../../..


