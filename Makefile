default: deps build

deps:
	@sudo apt-get install -y -qq \
		libeigen3-dev \
		libeigen3-doc \
		libopencv-* \
		python3-dev

build:
	@git submodule init
	@git submodule update
	@mkdir -p build && cd build && cmake .. && make

install:
	@cd build && sudo make install

run_python_example:
	@cd examples && python3 test_apriltag.py

clean:
	@rm -rf build
