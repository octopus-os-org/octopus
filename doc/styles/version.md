Two versions

- API version (for users)
```
<main>.<sub>.<add>

main: indicating not compitable api changes

sub: indicating api reduction but users can rebuild non-reduction api with the current api (or the authors don't think it will have a significant impact on users)

add: indicating api increasing

<draft>
use [a..z] to indicate major changes of api increaion?
e.g. 1.0.1,1.0.5,1.0.a,1.0.a5,1.0.b
</draft>


rule examples:

the first creation
0.0.0 => 0.0.1
after increasing api
0.0.1 => 0.0.3
after reducing api (the <add> becomes '0')
0.0.3 => 0.1.0
after increasing api
0.1.0 => 0.1.1
after incompatible api changes
0.1.1 => 1.0.0 (<sub> and <add> become '0')

```

- Code version

```
<main>.<major>.<minor>

todo: traditional meanings

```
