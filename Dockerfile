FROM ubuntu:22.10

COPY ./requirements.txt /uvr/requirements.txt

WORKDIR /uvr

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y tzdata && \
    apt install -y ffmpeg python3-pip python3-tk freeglut3-dev x11-xserver-utils && \
    pip3 install -r requirements.txt -i https://pypi.mirrors.ustc.edu.cn/simple #This is 中科大 image repository of pip3.
#Change to your own image repository of pip3, or just delete the -i argument if you are not in China.

COPY . /uvr

VOLUME [ "/uvr/sources", "/uvr/results" ]

ENTRYPOINT [ "python3" ]

CMD [ "/uvr/UVR.py" ]
