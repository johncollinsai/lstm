FROM python:slim

WORKDIR /home/posts/lstm

COPY requirements.txt requirements.txt 
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt

# I use boot.sh rather than ENTRYPOINT in the Dockerfile because the exec command
# in my boot.sh does not work here in Dockerfile in ENTRYPOINT. Don't know why
COPY lstm.ipynb lstm-dalle.png fig_1.png fig_2.png fig_3.png fig_4.png fig_5.png fig_6.png fig_7.png fig_8.png boot.sh ./ 

RUN chmod a+x boot.sh
ENV PORT 8080

# I follow https://github.com/photonics-project/notebooks/blob/main/Dockerfile
# but put jimustafa's ENTRYPOINT into boot.sh
ENTRYPOINT ["./boot.sh"]



