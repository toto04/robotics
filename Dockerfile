# syntax=docker/dockerfile:1

FROM ubuntu:20.04
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive

# install ROS
RUN apt -y update 
RUN apt -y upgrade
RUN apt -y install tmux nano vim curl gnupg
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt -y update 
RUN apt install -y ros-noetic-desktop-full
RUN apt install -y python3-rosdep
RUN apt install -y vim nano gedit 
RUN apt install -y ros-noetic-rqt* ros-noetic-jsk* ros-noetic-visualization-tutorials ros-noetic-move-base
RUN apt -y update
RUN apt install -y ros-noetic-plotjuggler-ros

ARG CACHEBUST=1

# setup bashrc
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
RUN echo "source /root/robotics/devel/setup.bash" >> /root/.bashrc

RUN echo "\"\e[5/root\": history-search-backward" >> /root/.inputrc
RUN echo "\"\e[6/root\": history-search-forward" >> /root/.inputrc

WORKDIR /root/robotics
CMD /bin/bash