docker build -t jrrlokken/multi-client:latest -t jrrlokken/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t jrrlokken/multi-server:latest -t jrrlokken/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t jrrlokken/multi-worker:latest -t jrrlokken/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push jrrlokken/multi-client:latest
docker push jrrlokken/multi-server:latest
docker push jrrlokken/multi-worker:latest

docker push jrrlokken/multi-client:$GIT_SHA
docker push jrrlokken/multi-server:$GIT_SHA
docker push jrrlokken/multi-worker:$GIT_SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jrrlokken/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=jrrlokken/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=jrrlokken/multi-worker:$GIT_SHA
