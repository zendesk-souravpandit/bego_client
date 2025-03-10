# melos commands

mlint-sync:
	melos run sync-lint-rules
mlint:
	melos run lint	

build-bego:
	cd apps/bego  && flutter build web -t lib/bego.main.dart --release

run-bego:
	dhttpd --path ./apps/bego/build/web/

run-bego-linux:
	cd apps/bego  && flutter run -t lib/bego.main.dart -d linux

push-bego:
	./scripts/update_bego_client.sh  
	
proto-clone:
	./scripts/copy_common_proto.sh ./packages/bego_service/protos;  

proto-google:
	 protoc --dart_out=packages/bego_service/lib/src/gen -I=packages/bego_service/protos packages/bego_service/protos/google/protobuf/any.proto \
    && protoc --dart_out=packages/bego_service/lib/src/gen -I=packages/bego_service/protos packages/bego_service/protos/google/protobuf/duration.proto \
    && protoc --dart_out=packages/bego_service/lib/src/gen -I=packages/bego_service/protos packages/bego_service/protos/google/protobuf/timestamp.proto	\

proto-buf-gen:
	buf generate;  

proto-gen:
	# find protos -name "packages/bego_service*.proto" | xargs protoc --dart_out=packages/bego_service/lib/src/gen -I=packages/bego_service/protos
	# cd packages/bego_service && find protos -name "*.proto" | xargs protoc --dart_out=grpc:lib/src/gen -I=protos  
	cd packages/bego_service && find protos -name "*.proto" | xargs protoc --dart_out=lib/src/gen -I=protos  
.PHONY: build-bego	