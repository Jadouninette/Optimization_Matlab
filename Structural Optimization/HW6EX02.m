function [history,searchdir] = HW6EX02
 
% Set up shared variables with OUTFUN
history.x = [];
history.fval = [];
searchdir = [];
 
% Xo is the starting point 
x0 = [-1 -1 -1];
options = optimoptions(@fmincon,'OutputFcn',@outfun,... 
    'Display','iter','Algorithm','active-set');
xsol = fmincon(@objfunction,x0,[],[],[],[],[],[],@confun,options);

%definition of the function's stop conditions
 function stop = outfun(x,optimValues,state)
     stop = false;
 
     switch state %The current state of the algorithm can be ('init', 'interrupt', 'iter', or 'done')
         case 'init'
             hold on
         case 'iter'
        % Concatenate current point and objective function value with history. 
        % x must be a row vector.
        % Stores the point and its corresponding objective function value in a variable called history
        % Stores the current search direction in a variable called searchdir. The search direction is a vector that points in the direction from the current point to the next one.

           history.fval = [history.fval; optimValues.fval];
           %f val id for current objective function value
           
           history.x = [history.x; x];
         % Concatenate current search direction with searchdir.
           searchdir = [searchdir;optimValues.searchdirection'];
                    % searchdirection is for current search direction
                %optimValues is the structure containing data from the current iteration
           plot(x(1),x(2),'o');
         % Label points with iteration number and add title.
         % Add .15 to x(1) to separate label from plotted 'o'
           text(x(1)+.15,x(2),num2str(optimValues.iteration));  % Label points with iteration number and add title.
           title('Sequence of Points Computed by the function fmincon');
         case 'done'
             hold off
         otherwise
     end
 end
 

%definition of the objective function (can also be input by the user)
 function f = objfunction(x)
    % f = ((10*(x(1)^2))+(x(1)*(x(2)^2))+(x(3)*(x(1)+(x(2)^2))));
      f = input('Enter the function : \n');
 end
 
%definition of the constraint functions (can also be input by the user)
 function [c, ceq] = confun(x)
     % Nonlinear inequality constraints
     %c = [-10+sqrt(x(1)^2+x(2)^2)-x(3);x(3)-3+sqrt(x(1)^2+x(2)^2)];
      c = input('Enter the nonlinear inequality constraints : \n');
     
     % Nonlinear equality constraints
     % ceq = [];
     ceq = input('Enter the nonlinear equality constraints : \n');
 end

disp('Search Directions');disp(searchdir)
disp('Function Values');disp(history.fval)

%outputfn = @(in,optimValues,state)outfun(in,optimValues,state,idx);

%opts = optimoptions('fmincon','Algorithm','sqp','OutputFcn',outputfn);


end
%https://fr.mathworks.com/help/optim/ug/output-functions.html