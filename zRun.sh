#!/bin/bash


# ./scripts/local_patch.sh
# ./gradlew build
# ./gradlew :sample-apps:springboot:build


    # OTEL_INSTRUMENTATION_COMMON_DEFAULT_ENABLED="true" \
    # OTEL_INSTRUMENTATION_SERVLET_ENABLED="true" \
    # OTEL_INSTRUMENTATION_TOMCAT_ENABLED="true" \

OTEL_RESOURCE_ATTRIBUTES="service.name=ADOT-Java-lkmain-zRun" \
    JAVA_TOOL_OPTIONS=" -javaagent:./otelagent/build/libs/aws-opentelemetry-agent-2.18.0-SNAPSHOT.jar" \
    OTEL_JAVAAGENT_DEBUG="true" \
    OTEL_LOG_LEVEL="debug" \
    OTEL_METRICS_EXPORTER="none" \
    OTEL_EXPORTER_OTLP_TRACES_ENDPOINT="http://127.0.0.1:4318/v1/traces" \
    OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf" \
    OTEL_TRACES_SAMPLER="always_on" \
    OTEL_TRACES_SAMPLER_ARG="endpoint=http://localhost:2000" \
    OTEL_AWS_APPLICATION_SIGNALS_ENABLED="true" \
    OTEL_AWS_APPLICATION_SIGNALS_EXPORTER_ENDPOINT="http://localhost:4316/v1/metrics" \
    java -jar sample-apps/springboot/build/libs/springboot-2.18.0-SNAPSHOT.jar
