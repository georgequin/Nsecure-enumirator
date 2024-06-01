// Openapi Generator last run: : 2024-01-31T19:27:14.004346
import 'package:kenmack/core/utils/config.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties:
  AdditionalProperties(pubName: 'kenmack_api', pubAuthor: 'George David...'),
  inputSpec: InputSpec(path: 'http://${AppConfig.baseUrl}/v3/api-docs/'),
  generatorName: Generator.dio,
  outputDirectory: 'kenmack_api',
  typeMappings: {'State': 'StateModel'},

)
class OpenSDKConfiguration {}