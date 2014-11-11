<div class="ar-dashboard-wrapper" ng-controller="DashboardController">
	<h4>Eventos y Solicitudes</h4>
	<div class="ar-eventlist ar-vwrap">
		<div class="ar-event" ng-repeat="event in events">
			<div class="ar-vwrap ar-row">
				<div class="col-xs-12 col-sm-9 ar-nopad">
					<div class="col-xs-2 ar-eid">{{event.pid}}</div>
					<div class="col-xs-10 ar-field">{{event.title}}</div>
				</div>
				<div class="col-xs-12 col-sm-3 ar-nopad">
					<div class="col-xs-10 ar-field">{{event.begins}}</div>
					<div class="col-xs-2 ar-down" ></div>
				</div>
				<div class="ar-expanded-wea">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere quibusdam quidem enim fuga omnis iure cum illum sed aperiam, suscipit unde tenetur explicabo minima, adipisci, dolorem quia quas aliquid voluptates praesentium modi, nesciunt impedit repellat mollitia? Molestiae unde mollitia autem id culpa minima quas, perferendis neque earum facilis inventore laudantium blanditiis expedita a eum quibusdam natus quisquam. Impedit iure fugit illo aliquid rem, culpa aspernatur, porro maxime reiciendis velit ipsam, neque ab ea aut illum, deleniti recusandae eaque ex dolores eum a dolor. Totam commodi nam alias numquam quas quo esse est, eveniet enim quia soluta impedit repudiandae nisi delectus cupiditate dolorem itaque maiores voluptates officiis ipsam eligendi. Quisquam recusandae fugit obcaecati, consequatur asperiores commodi dolorem accusamus! Assumenda quos a, itaque odit inventore repellendus deleniti dolores tenetur tempore quam culpa dolor esse perspiciatis maxime. Amet iste vel adipisci nostrum voluptate commodi itaque odit quibusdam hic alias culpa, quam a. Magnam non aspernatur nihil id est blanditiis sed vel accusamus, asperiores nulla maxime vero debitis error pariatur commodi veritatis, ad quos officiis iure quisquam beatae! Quis fuga laboriosam cum maiores perspiciatis praesentium, rerum labore ipsam porro sequi vitae, aperiam eos, asperiores. Sint eaque, nam temporibus ratione, officia et nihil ea corporis possimus doloremque aliquam quidem minima facere veritatis nesciunt, enim dolor consequuntur necessitatibus in! Molestias ex, quisquam recusandae sit, veritatis dicta fugit, quas sed quam eaque ducimus, voluptas deserunt velit ut! Deserunt voluptates blanditiis, nam autem iure sed aut iste est harum, labore sint quia, accusantium quasi voluptatibus, quis odit voluptate.
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	angular.module('dashboard',[])
		.controller('DashboardController',[ '$scope' ,function($scope){
			$scope.events = [
				{
					pid: '20150110',
					title: 'Mexican International Conference on Artificial Intelligence',
					begins: '15/Enero/2015'
				}
			];
		}]);
</script>