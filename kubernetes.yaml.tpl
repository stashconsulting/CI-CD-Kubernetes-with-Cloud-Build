apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-api
  labels:
    app: api
spec:
  replicas: 1
  selector:
    matchLabels:
      app: api
  template:
    metadata:
      labels:
        app: api
    spec:
      containers:
      - name: test
        image: gcr.io/GOOGLE_CLOUD_PROJECT/test:COMMIT_SHA
        ports:
        - containerPort: 5000
---
kind: Service
apiVersion: v1
metadata:
  name: flask-api-service
spec:
  selector:
    app: api
  ports:
  - protocol: TCP
    port: 80
    targetPort: 5000
  type: LoadBalancer
