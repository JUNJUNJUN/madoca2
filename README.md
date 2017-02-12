# madoca2
read write madoca2 format file


###### how to use
```
p Madoca2::VERSION
 => "1.0.0"
 
madoca2=Madoca2::File.load(filename)
 => #<Madoca2::MessageRole > 
 

p madoca2.size
 => 1203
 
p madoca2[4]
 => #<struct Madoca2::Message verb="put", object="sr_mag_ps_b", complement="exec_%fs", process="em_mag_b_ramp", pre_process="none", post_process="em_std_ret">
 
p madoca2[4].verb
 => "put"
 
p madoca2[4].v
 => "put"
 
p madoca2[4].to_h
 => {:verb=>"put", :object=>"sr_mag_ps_b", :complement=>"exec_%fs", :process=>"em_mag_b_ramp", :pre_process=>"none", :post_process=>"em_std_ret"}
```
