%--------------------------------------
% input data for nodal coordinate values
% nodal_coord(i,j) where i -> node no. and j -> x or y or z
%--------------------------------------
x = linspace(0,1,npa);
y = linspace(0,1,npa);
z = linspace(0,1,npa);

[Y,X,Z] 	 = meshgrid(y,x,z);
nodal_coord  = [reshape(X,[],1) reshape(Y,[],1) reshape(Z,[],1)];
clear x y z X Y Z
%
%--------------------------------------
% input data for nodal connectivity for each element
% nodes(i,j) where i -> element no. and j -> connected node
%--------------------------------------
nodes = zeros(nnode,4);
for k = 1:npa-1
	for j = 1:npa-1
		for i = 1:npa-1
			node    = i +npa*(j-1) +npa^2*(k-1);
			element = (0:npa-1:npa*(npa-1)) +i +6*(npa-1)*(j-1) +6*(npa-1)^2*(k-1);
			nodes(element(1),:) = [node 	node+1			node+npa		1+node+npa^2];
			nodes(element(2),:) = [node 	node+npa		node+npa^2		1+node+npa^2];
			nodes(element(3),:) = [1+node 	2+node 			node+npa		1+node+npa^2];
			nodes(element(4),:) = [node+npa	1+node+npa		1+node+npa^2	1+node+npa+npa^2];
			nodes(element(5),:) = [node+npa	node+npa^2		1+node+npa^2	node+npa+npa^2];
			nodes(element(6),:) = [node+npa	1+node+npa^2	node+npa+npa^2	1+node+npa+npa^2];
		end
	end
end
clear node element k j i