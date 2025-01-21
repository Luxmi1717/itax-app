import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:itax/cubits/itr_cubit.dart';
import 'package:itax/cubits/itr_state.dart';
import 'package:itax/models/itr_model.dart';
import 'package:itax/presentation/older_widgets/widgets/back_button.dart';
import 'package:itax/presentation/older_widgets/widgets/form_widgets.dart';
import 'package:itax/utility/date_time.dart';


class ITRHomeScreen extends StatefulWidget {
  const ITRHomeScreen({super.key});

  @override
  State<ITRHomeScreen> createState() => _ITRHomeScreenState();
}

class _ITRHomeScreenState extends State<ITRHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    final theme = Theme.of(context);

    return BlocConsumer<ITRCubit, ITRState>(
      listener: (context, state) {
        if (state is ITRForm16Processed) {
          context.push('/file-itr/upload');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: const BlueBackButton(),
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              title: const Text(
                'ITR',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
              ),
            ),
            body: SizedBox(
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Moneyverse Business Balance.png',
                        height: 200,
                        width: 400,
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: Text(
                          'Easing the tax filing process with AI',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff434343)
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Upload your Form 16 and let our system handle the rest',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff434343)
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 32),
                      NeomorphicButton(
                        onTap: () {
                          context.push(
                            '/file-itr',
                          );
                        },
                        buttonText: 'File ITR',
                      ),
                      const SizedBox(height: 32),
                      const Row(
                        children: [
                          Text(
                            'Recent Submissions',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Image.asset(
                          'assets/images/note.png',
                          scale: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildList(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildList(BuildContext context) {
    return ValueListenableBuilder<Box<ITRModel>>(
      valueListenable: Hive.box<ITRModel>('itr_models').listenable(),
      builder: (context, box, _) {
        final models = box.values.toSet().toList();

        if (models.isEmpty) {
          return const Center(
            child: Text('No record found',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xff999999),
            )),
          );
        }

        return ListView.builder(
          itemCount: models.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final model = models[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildListItem(context, model),
                if (index < models.length - 1)
                  const SizedBox(
                    height: 16,
                  ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildListItem(BuildContext context, ITRModel model) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 224, 224, 224),
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<ITRCubit>().openForm16(model);
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assessment Year: ${DateTimeUtil.processAssessmentYear(model.partAAssessmentYear)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pan of Employee: ${model.partBPanOfEmployee}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
