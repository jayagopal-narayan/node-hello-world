{{- define "common.labels" -}}
app: {{ .Values.app }}
context: {{ .Values.context }}
component: {{ .Component }}
version: {{ .Values.version }}
chart: {{ .Chart.Name }}
chartVersion: {{ .Chart.Version }}
{{- end -}}

{{- define "common.name" -}}
{{ .Values.app }}-{{ .Values.context }}-{{ .Component }}-{{ .Values.version }}
{{- end -}}

{{- define "common.ingress-type" -}}
{{- if .Values.ingress.external -}}
external
{{- else -}}
internal
{{- end -}}
{{- end -}}