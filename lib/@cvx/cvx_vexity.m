function v = cvx_vexity( x )

global cvx___
s = x.size_;
if any( s == 0 ),
    v = cvx_zeros( s );
    return
end
p  = cvx___.vexity;
b  = x.basis_;
n  = length( p );
nb = size( b, 1 );
if nb < n,
    p = p( 1 : nb, : );
elseif n < nb,
    p( n+1:nb, : ) = 0;
end
b = b( p ~= 0, : );
if isempty( b ),
    v = cvx_zeros( x.size_ );
    return
end
p = nonzeros(p).';
if cvx___.nan_used,
    b = sparse( b );
end
v = p * b;
v( abs( v ) ~= abs( p ) * abs( b ) ) = NaN;
v = sign( v );
v = cvx_reshape( v, x.size_ );

% Copyright 2007 Michael C. Grant and Stephen P. Boyd.
% See the file COPYING.txt for full copyright information.
% The command 'cvx_where' will show where this file is located.
