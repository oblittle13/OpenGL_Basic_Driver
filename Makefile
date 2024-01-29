CC=g++
CFLAGS=-Iinclude -std=c++11 -g
LIBS=-lfreeglut -lglew32 -lopengl32 -lglu32
# Default target executed when no arguments are given to make.
default_target: project
.PHONY : default_target

project: project.o car.o trafficLight.o road.o InitShader.o
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

project.o: project.cpp
	$(CC) $(CFLAGS) -c project.cpp

car.o: car.cpp
	$(CC) $(CFLAGS) -c car.cpp

trafficLight.o: trafficLight.cpp
	$(CC) $(CFLAGS) -c trafficLight.cpp

road.o: road.cpp
	$(CC) $(CFLAGS) -c road.cpp

project.o: car.h trafficLight.h road.h
car.o: car.h
trafficLight.o: trafficLight.h
road.o: road.h

InitShader.o: common/InitShader.cc
	$(CC) $(CFLAGS) -c $^

clean:
	rm -f project *~ *.o

debug: project
	gdb project
