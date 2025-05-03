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
	./scripts/copy_common_proto.sh ./services/beservice/protos;  

proto-google:
	 protoc --dart_out=services/beservice/lib/src/ -I=services/beservice/protos services/beservice/protos/google/protobuf/any.proto \
    && protoc --dart_out=services/beservice/lib/src/ -I=services/beservice/protos services/beservice/protos/google/protobuf/duration.proto \
    && protoc --dart_out=services/beservice/lib/src/ -I=services/beservice/protos services/beservice/protos/google/protobuf/timestamp.proto	\

proto-gen:
	buf generate && \
    cd services/beservice && find protos -name "*.proto" | xargs protoc --dart_out=grpc:lib/src/ -I=protos && \
    find protos -name "*.proto" | xargs protoc --dart_out=lib/src/ -I=protos
.PHONY: build-bego	